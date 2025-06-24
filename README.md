# A dynamic GPF scheduler for 5G HetNets aided by Neural Networks and Differential Evolution
This is a repository regarding the paper "**A dynamic GPF scheduler for 5G HetNets aided by Neural Networks and Differential Evolution**". This document shows the usage of **Differential Evolution** (DE) aiming to optimize the Generalized Proportional Fair (**GPF**) **Scheduler** on a simulated **5G** Heterogeneous Network (**HetNet**).

# 1. Why was this repository created?
The paper that presents this code's results, "**A dynamic GPF scheduler for 5G HetNets aided by Neural Networks and Differential Evolution**", has the main idea of mimicking the **Differential Evolution** (DE) optimization using a **Feedforward Neural Network** and creating a **dynamic scheduler**.

# 2. Simulator
The simulator used in this paper is the **Vienna 5G System Level Simulator**, which allows the modelling of a scenario. Learn more at the URL below.
> https://www.tuwien.at/etit/tc/en/vienna-simulators/vienna-5g-simulators/.

# 3. Mean Simulation File - neuralDE.m
The mean simulation file that uses the Dynamic Scheduler in the HetNet scenario is called ```neuralDE.m```, present in the root repository.

## 3.1 Dynamic Scheduler parameter
 **Number of users:** Changing the number of users must be divisible by 4 (due to the network's 4 user classes being equinumerous). ```usr = 4 * n``` (n must be an integer).  

# 4. neuralNet.m
The  ```neuralNet.m``` file is responsible for creating and training the neural network that will later become the Dynamic Scheduler.

1. **Network Neurons.** The values (integers) set the number of network neurons from the input to the (j-1) last deep layer (left to right).
```netconf = [m_1 m_2 ... m_j];```

2. **Save your model.** If you want to test different networks, save your model to benchmark later. 
```save('yourModelName.mat', 'net');```

# 5. Neural Network Data
The data in which the Neural Network was trained is present in ```AB.m```, ```MEAN.m```, and ```networkMeanOF.m```.file is responsible for creating and training the neural network that will later become the Dynamic Scheduler.

1. **AB.m** DE optimized $\alpha$ and $\beta$ values for all scenarios and seeds.
2. **MEAN.m**. Mean SINR for all scenarios and seeds.
3. **networkMeanOF.m**. Generated Neural Network

# 6. Aditional code
Additional codes must be used to make our Dynamic Scheduler run. They are present in the URL below, adding the scenario, DE algorithm, and more.

> [getuliom/optimizingGPF: Repository regarding "Optimizing GPF scheduler with Differential Evolution on 5G HetNet simulated scenarios" paper.](https://github.com/getuliom/optimizingGPF) 

# Submitted, but not published
The mentioned paper was submitted to the **MDPI *Telecom***  and it's currently in the review phase. If accepted, further details will be added to that README file.
