# PKU LDPC encoder & decoder simulation
北大信科研究生课程“信息论与编码理论”第一次大作业LDPC编解码性能仿真
## 食用方法
data&result文件夹中的Matrix(2016,1008)Block56为H矩阵块，通过load方法导入matlab中
### code文件夹
运行get_H可获得H矩阵
find_best_alpha_beta可仿真得到归一化最小和算法和偏置最小和算法alpa和beta的性能图，继而得到最佳的参数
simulation可得到和积算法（Sum-Product，SP，系统仿真中常用）最小和算法（Min-Sum，MS，硬件实现常用）归一化最小和算法(Normalized Min-Sum，NMS) 偏置最小和算法(Offset Min-Sum，OMS)四种LDPC译码方法的性能曲线
### data&result文件夹
里面有用于生成H矩阵的Matrix(2016,1008)Block56以及仿真结果
