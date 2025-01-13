#!/usr/bin/perl

use strict;
use warnings;

# 打开文件进行读取
open my $input, '<', 'all_pan_stat_pav.txt' or die "无法打开输入文件: $!";
open my $output, '>', 'output_file.txt' or die "无法打开输出文件: $!";

# 读取文件头并写入输出文件
my $header = <$input>;
print $output $header;

# 逐行处理数据
while (my $line = <$input>) {
    chomp($line);
    my @columns = split(/\s+/, $line);  # 假设列之间用空格分隔，你可以根据实际情况调整分隔符
    my $id = shift @columns;  # 提取首列（ID）

    # 遍历剩余的列，将不为0的值改为1
    for my $i (0..$#columns) {
        $columns[$i] = ($columns[$i] != 0) ? 1 : 0;
    }

    # 将处理后的行写入输出文件
    print $output "$id\t", join("\t", @columns), "\n";
}

# 关闭文件
close $input;
close $output;

