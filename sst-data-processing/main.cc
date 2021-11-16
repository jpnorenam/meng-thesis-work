#include <vector>
#include <ios>
#include <algorithm>
#include <omp.h>
#include <tuple>

std::tuple<float, int> readStepTimesFile(char* file_name) {
    FILE *file  = fopen(file_name, "r");
    if (file == NULL) {
        printf("Error opening %s\n", file_name);
        return std::make_tuple(0.0, 0);
    }

    int steps = 0;
    float ts_duration;
    float mean = 0;
    fscanf(file, "%*[^\n]");
    while (fscanf(file, "%f", &ts_duration) == 1) {
        mean += ts_duration;
        steps ++;
    }
    return std::make_tuple(mean/steps, 1);
}

int main(int argc, char** argv) {
    using namespace std;

    int nCopies_s = atoi(argv[1]);
    int nCopies_e = atoi(argv[2]);
    int nThreads = atoi(argv[3]);
    int nSeq = atoi(argv[4]);
    char file_fmt[] = "./logs/WSCC_9bus_decoupled_%d_%d_%d_step_times.log";
    char result_fmt[] = "copies = %d, threads = %d, mean = %f, seqs = %d";

    for (int i = nCopies_s; i < nCopies_e ; i++) {
        for (int j = 0 ; j <= nThreads ; j+=2) {
            float mean = 0.0;
            int seqs = 0;
            
            #pragma omp parallel for reduction(+:mean,seqs)
            for ( int k = 1 ; k <= nSeq ; k++ ) {
                char file_name[100];
                float seqMean;
                int seqPP;
                sprintf(file_name, file_fmt, i, j, k);
                tie(seqMean, seqPP) = readStepTimesFile(file_name);
                mean += seqMean;
                seqs += seqPP;
            }

            mean /= seqs;
            char result_str[100];
            sprintf(result_str, result_fmt, i, j, mean, seqs);
            printf("%s\n", result_str);
        
        }
    }
}
