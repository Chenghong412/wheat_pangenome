#!/usr/bin/perl
use strict;
use warnings;

# 从数组中选择$k个元素的组合
sub combinations {
    my ($arr, $k) = @_;
    return [] if $k == 0;
    return [map([$_], @$arr)] if $k == 1;

    my @combs;
    for my $i (0 .. $#$arr - $k + 1) {
        my $val = $arr->[$i];
        my $tail_combs = combinations([@$arr[$i+1 .. $#$arr]], $k-1);
        push @combs, map([$val, @$_], @$tail_combs);
    }
    return \@combs;
}

open my $fh, '<', 'Orthogroups.GeneCount.tsv' or die $!;

my $header = <$fh>;
chomp $header;
my @columns = split(/\t/, $header);

# 获得所有需要统计的物种列的索引
my @indices = (1 .. ($#columns - 1));

# 总物种数量
my $total_species = scalar @indices;

my %counts;

while (<$fh>) {
    chomp;
    my @fields = split(/\t/);

    # 对每个数字从1到总物种数量进行循环
    for my $i (1 .. $total_species) {
        my $combs = combinations(\@indices, $i);
        for my $comb (@$combs) {
            my @species = @columns[@$comb];
            my $key = join("-", @species);

            # 确保所有的物种在组合中都不为0
            $counts{"n$i"}{$key}++ if all_non_zero(\@fields, $comb);
        }
    }
}

close $fh;

foreach my $n (keys %counts) {
    open my $out, '>', "$n.txt" or die $!;
    foreach my $key (sort keys %{$counts{$n}}) {
        print $out "$key $counts{$n}{$key}\n";
    }
    close $out;
}

# 辅助函数来检查在指定索引的值是否都不为0
sub all_non_zero {
    my ($arr, $indices) = @_;
    for my $index (@$indices) {
        return 0 if $arr->[$index] == 0;
    }
    return 1;
}

