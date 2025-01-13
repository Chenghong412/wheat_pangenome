#!/usr/bin/perl

use strict;
use warnings;

# 打开输入文件
open(my $input_file, '<', 'Orthogroups.GeneCount.tsv') or die "无法打开输入文件: $!";

# 打开输出文件
open(my $output_file, '>', 'nonzero_rows.txt') or die "无法创建输出文件: $!";

my $header = <$input_file>;
chomp $header;

# 写入标题行到输出文件
 print $output_file "$header\n";
# 跳过文件的头部（标题行）
<$input_file>;

# 处理每一行数据
while (my $line = <$input_file>) {
    chomp $line;
    my @columns = split /\t/, $line;
    
    # 检查除了第一列（OG号）之外的列是否都不为0

    my $all_nonzero = 1;
    for my $i (1 .. $#columns) {
        if ($columns[$i] == 0) {
            $all_nonzero = 0;
            last;
        }
    }

    # 如果所有列都不为0，则输出到输出文件
    if ($all_nonzero) {
        print $output_file "$line\n";
    }
}


# 关闭文件句柄
close($input_file);
close($output_file);

print "已将所有行写入非零行文件 'nonzero_rows.txt'\n";
