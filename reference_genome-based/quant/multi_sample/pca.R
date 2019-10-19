#タブ区切りのデータの読み込み
data <- read.table("output/kaiko_5tissues_2.txt", header=TRUE, row.name=1, sep="\t", quote="")
#主成分分析を実行
data.pca <- prcomp(t(data))
#名前を得る
names(data.pca)
#行列を転置
data.pca.sample <- t(data) %*% data.pca$rotation[,1:2]
#PCAの結果をプロット
plot(data.pca.sample, main="PCA")
#ラベルをつけて、色づけ
text(data.pca.sample, colnames(data), col = c(rep("red",3), rep("blue",3), rep("green",3), rep("cyan",3), rep("black",3)))
#寄与率を見る
summary(data.pca)
