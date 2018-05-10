# Explore Data Set

library('ProjectTemplate')
load.project()

library('cowplot')

# Read Data
TData <- FlowImbalanceTestData.LP.HP.p125

#Shuffle Data
SData <- TData[sample(nrow(TData)),]

#Split Shuffled Data into training data, validation data & test data
TrgData <- SData[1:(0.6*nrow(SData)),]
ValData <- SData[(0.6*nrow(SData)):(0.8*nrow(SData)),]
TstData <- SData[(0.8*nrow(SData)):nrow(SData),]

#Build histogram of response variable - Erosion Potential
ggplot(data=TrgData,aes(x=ErosionPotential)) +
  geom_histogram(binwidth=0.02,fill="Magenta",color="Black")
ggsave(file.path('graphs', 'ResponseHistogram.pdf'))

#Explore Features - Process Flows Across 12 RPXs
p1p <- ggplot(TrgData, aes(x = PX1ProcFlow, y = ErosionPotential, color = "Blue"))
p1p <- p1p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX1 Process Flow') 
p1p <- p1p + xlab('PX1 Process Flow') + ylab('Erosion Potential')
p1p <- p1p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))
p1p

p2p <- ggplot(TrgData, aes(x = PX2ProcFlow, y = ErosionPotential, color = "Blue")) 
p2p <- p2p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX2 Process Flow') 
p2p <- p2p + xlab('PX2 Process Flow') + ylab('Erosion Potential')
p2p <- p2p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p3p <- ggplot(TrgData, aes(x = PX3ProcFlow, y = ErosionPotential, color = "Blue")) 
p3p <- p3p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX3 Process Flow') 
p3p <- p3p + xlab('PX3 Process Flow') + ylab('Erosion Potential')
p3p <- p3p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p4p <- ggplot(TrgData, aes(x = PX4ProcFlow, y = ErosionPotential, color = "Blue")) 
p4p <- p4p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX4 Process Flow') 
p4p <- p4p + xlab('PX4 Process Flow') + ylab('Erosion Potential')
p4p <- p4p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p5p <- ggplot(TrgData, aes(x = PX5ProcFlow, y = ErosionPotential, color = "Blue")) 
p5p <- p5p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX5 Process Flow') 
p5p <- p5p + xlab('PX5 Process Flow') + ylab('Erosion Potential')
p5p <- p5p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p6p <- ggplot(TrgData, aes(x = PX6ProcFlow, y = ErosionPotential, color = "Blue")) 
p6p <- p6p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX6 Process Flow') 
p6p <- p6p + xlab('PX6 Process Flow') + ylab('Erosion Potential')
p6p <- p6p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p7p <- ggplot(TrgData, aes(x = PX7ProcFlow, y = ErosionPotential, color = "Blue")) 
p7p <- p7p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX7 Process Flow') 
p7p <- p7p + xlab('PX7 Process Flow') + ylab('Erosion Potential')
p7p <- p7p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p8p <- ggplot(TrgData, aes(x = PX8ProcFlow, y = ErosionPotential, color = "Blue")) 
p8p <- p8p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX8 Process Flow') 
p8p <- p8p + xlab('PX8 Process Flow') + ylab('Erosion Potential')
p8p <- p8p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p9p <- ggplot(TrgData, aes(x = PX9ProcFlow, y = ErosionPotential, color = "Blue")) 
p9p <- p9p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX9 Process Flow') 
p9p <- p9p + xlab('PX9 Process Flow') + ylab('Erosion Potential')
p9p <- p9p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p10p <- ggplot(TrgData, aes(x = PX10ProcFlow, y = ErosionPotential, color = "Blue")) 
p10p <- p10p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX10 Process Flow') 
p10p <- p10p + xlab('PX10 Process Flow') + ylab('Erosion Potential')
p10p <- p10p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p11p <- ggplot(TrgData, aes(x = PX11ProcFlow, y = ErosionPotential, color = "Blue")) 
p11p <- p11p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX11 Process Flow') 
p11p <- p11p + xlab('PX11 Process Flow') + ylab('Erosion Potential')
p11p <- p11p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p12p <- ggplot(TrgData, aes(x = PX12ProcFlow, y = ErosionPotential, color = "Blue")) 
p12p <- p12p + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX12 Process Flow') 
p12p <- p12p + xlab('PX12 Process Flow') + ylab('Erosion Potential')
p12p <- p12p + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

plot_ProcFlow <- plot_grid(p1p,p2p,p3p,p4p,p5p,p6p,p7p,p8p,p9p,p10p,p11p,p12p, ncol = 3)
save_plot("./graphs/Features_ProcessFlows.png", plot_ProcFlow, ncol = 3, nrow = 4, base_aspect_ratio = 0.8)

#Explore Features - Motive Flows Across 12 RPXs
p1m <- ggplot(TrgData, aes(x = PX1MotFlow, y = ErosionPotential, color = "Blue")) 
p1m <- p1m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX1 Motive Flow') 
p1m <- p1m + xlab('PX1 Motive Flow') + ylab('Erosion Potential')
p1m <- p1m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p2m <- ggplot(TrgData, aes(x = PX2MotFlow, y = ErosionPotential, color = "Blue")) 
p2m <- p2m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX2 Motive Flow') 
p2m <- p2m + xlab('PX2 Motive Flow') + ylab('Erosion Potential')
p2m <- p2m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p3m <- ggplot(TrgData, aes(x = PX3MotFlow, y = ErosionPotential, color = "Blue")) 
p3m <- p3m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX3 Motive Flow') 
p3m <- p3m + xlab('PX3 Motive Flow') + ylab('Erosion Potential')
p3m <- p3m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p4m <- ggplot(TrgData, aes(x = PX4MotFlow, y = ErosionPotential, color = "Blue")) 
p4m <- p4m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX4 Motive Flow') 
p4m <- p4m + xlab('PX4 Motive Flow') + ylab('Erosion Potential')
p4m <- p4m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p5m <- ggplot(TrgData, aes(x = PX5MotFlow, y = ErosionPotential, color = "Blue")) 
p5m <- p5m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX5 Motive Flow') 
p5m <- p5m + xlab('PX5 Motive Flow') + ylab('Erosion Potential')
p5m <- p5m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p6m <- ggplot(TrgData, aes(x = PX6MotFlow, y = ErosionPotential, color = "Blue")) 
p6m <- p6m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX6 Motive Flow') 
p6m <- p6m + xlab('PX6 Motive Flow') + ylab('Erosion Potential')
p6m <- p6m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p7m <- ggplot(TrgData, aes(x = PX7MotFlow, y = ErosionPotential, color = "Blue")) 
p7m <- p7m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX7 Motive Flow') 
p7m <- p7m + xlab('PX7 Motive Flow') + ylab('Erosion Potential')
p7m <- p7m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p8m <- ggplot(TrgData, aes(x = PX8MotFlow, y = ErosionPotential, color = "Blue")) 
p8m <- p8m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX8 Motive Flow') 
p8m <- p8m + xlab('PX8 Motive Flow') + ylab('Erosion Potential')
p8m <- p8m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p9m <- ggplot(TrgData, aes(x = PX9MotFlow, y = ErosionPotential, color = "Blue")) 
p9m <- p9m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX9 Motive Flow') 
p9m <- p9m + xlab('PX9 Motive Flow') + ylab('Erosion Potential')
p9m <- p9m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p10m <- ggplot(TrgData, aes(x = PX10MotFlow, y = ErosionPotential, color = "Blue")) 
p10m <- p10m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX10 Motive Flow') 
p10m <- p10m + xlab('PX10 Motive Flow') + ylab('Erosion Potential')
p10m <- p10m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p11m <- ggplot(TrgData, aes(x = PX11MotFlow, y = ErosionPotential, color = "Blue")) 
p11m <- p11m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX11 Motive Flow') 
p11m <- p11m + xlab('PX11 Motive Flow') + ylab('Erosion Potential')
p11m <- p11m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p12m <- ggplot(TrgData, aes(x = PX12MotFlow, y = ErosionPotential, color = "Blue")) 
p12m <- p12m + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('PX12 Motive Flow') 
p12m <- p12m + xlab('PX12 Motive Flow') + ylab('Erosion Potential')
p12m <- p12m + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

plot_MotFlow <- plot_grid(p1m,p2m,p3m,p4m,p5m,p6m,p7m,p8m,p9m,p10m,p11m,p12m, ncol = 3)
save_plot("./graphs/Features_MotiveFlows.png", plot_MotFlow, ncol = 3, nrow = 4, base_aspect_ratio = 0.8)

pn <- ggplot(TrgData, aes(x = numRPX, y = ErosionPotential, color = "Blue")) 
pn <- pn + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('number of RPXs Running') 
pn <- pn + xlab('numRPX') + ylab('Erosion Potential')
pn <- pn + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

save_plot("./graphs/Features_numRPX.png", pn, base_aspect_ratio = 2)
