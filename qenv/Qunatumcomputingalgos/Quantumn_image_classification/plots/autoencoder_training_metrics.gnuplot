
set terminal pngcairo size 1400,950 enhanced font "Times New Roman,12"
set output "/home/adminpc/Documents/Professors_Diary/QuantumnComputing/qenv/Qunatumcomputingalgos/Quantumn_image_classification/plots/autoencoder_training_metrics_gnuplot.png"
set multiplot layout 2,2 title "Autoencoder Training Metrics"
set datafile separator whitespace
set grid
set key outside
set xlabel "Epoch"
set ylabel "Accuracy"
set title "Accuracy"
plot "/home/adminpc/Documents/Professors_Diary/QuantumnComputing/qenv/Qunatumcomputingalgos/Quantumn_image_classification/plots/autoencoder_training_metrics.dat" using 1:2 with linespoints lw 2 pt 7 ps 1 lc rgb "#2E8B57" title "accuracy"
set xlabel "Epoch"
set ylabel "Validation Accuracy"
set title "Validation Accuracy"
plot "/home/adminpc/Documents/Professors_Diary/QuantumnComputing/qenv/Qunatumcomputingalgos/Quantumn_image_classification/plots/autoencoder_training_metrics.dat" using 1:3 with linespoints lw 2 pt 7 ps 1 lc rgb "#1E90FF" title "val_accuracy"
set xlabel "Epoch"
set ylabel "MSE Loss"
set title "Loss"
plot "/home/adminpc/Documents/Professors_Diary/QuantumnComputing/qenv/Qunatumcomputingalgos/Quantumn_image_classification/plots/autoencoder_training_metrics.dat" using 1:4 with linespoints lw 2 pt 7 ps 1 lc rgb "#B22222" title "loss"
set xlabel "Epoch"
set ylabel "Validation Loss"
set title "Validation Loss"
plot "/home/adminpc/Documents/Professors_Diary/QuantumnComputing/qenv/Qunatumcomputingalgos/Quantumn_image_classification/plots/autoencoder_training_metrics.dat" using 1:5 with linespoints lw 2 pt 7 ps 1 lc rgb "#6A0DAD" title "val_loss"
unset multiplot
