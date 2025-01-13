#!/usr/bin/perl

use strict;
use warnings;

# 打开输入文件
open(my $input_file, '<', 'Orthogroups.GeneCount.tsv') or die "无法打开输入文件: $!";

# 打开输出文件
open(my $output_file, '>', 'rows_with_zeros.txt') or die "无法创建输出文件: $!";

# 读取和保存第一行（标题行）
my $header = <$input_file>;
chomp $header;

# 写入标题行到输出文件
print $output_file "$header\n";

# 处理每一行数据
while (my $line = <$input_file>) {
    chomp $line;
    my @columns = split /\t/, $line;

    # 统计每一行中的0的个数
    my $zero_count = 0;
    for my $i (1 .. $#columns-1) {
        if ($columns[$i] == 0) {
            $zero_count++;
        }
    }

    # 如果0的个数为1或2，则输出到输出文件
    if ($zero_count >16  ) {
        print $output_file "$line\n";
    }
}

# 关闭文件句柄
close($input_file);
close($output_file);

print "已将符合条件的行写入文件 'rows_with_zeros.txt'\n";
