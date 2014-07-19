## read the data
train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_s <- read.table("train/subject_train.txt")
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
test_s <- read.table("test/subject_test.txt")
feature <- read.table("features.txt", stringsAsFactors = FALSE)
activity <- read.table("activity_labels.txt")

## merge the data
all_x <- rbind(train_x, test_x)
all_y <- rbind(train_y, test_y)
all_s <- rbind(train_s, test_s)

## extract measurements containing "-mean()" or "-std()"
names(all_x) <- tolower(feature[, 2])
data <- all_x[, grep("-(mean|std)\\(\\)", names(all_x))]

## get activity and subject
label <- data.frame(activity = tolower(activity[all_y[, 1], 2]),
    subject = all_s[, 1])

## create a tidy data set
split <- split(data, list(label$activity, label$subject))
tidy <- NULL
for (d in names(split)) tidy <- rbind(tidy, colMeans(split[[d]]))
rownames(tidy) <- names(split)
c <- gsub("\\(\\)", "", colnames(tidy))
a <- c("^t", "^f", "bodybody")
b <- c("time", "freq", "body")
for (i in seq_along(a)) c <- sub(a[i], b[i], c)
colnames(tidy) <- gsub("\\-", "", c)
write.table(tidy, "tidy.txt")
