#!/bin/bash

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_20/tsp20_dcd_local --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_20/tsp20_dcd_global --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_20/tsp20_dcd_random --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_20/tsp20_default --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_50/tsp50_dcd_local --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_50/tsp50_dcd_global --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_50/tsp50_dcd_random --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_50/tsp50_default --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_100/tsp100_dcd_local --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_100/tsp100_dcd_global --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_100/tsp100_dcd_random --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true

python eval.py /home/radmajik/srl_cse_599/tsplib/tsplib.pkl --model outputs/tsp_100/tsp100_default --decode_strategy greedy --eval_batch_size 1 --load_TSPDataset true