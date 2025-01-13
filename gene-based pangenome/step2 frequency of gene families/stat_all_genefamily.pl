#!/usr/bin/perl

use strict;
use warnings;

# Open the input file
open my $fh, '<', 'Orthogroups.GeneCount.tsv' or die "Cannot open file: $!";

# Skip the header line
<$fh>;

my %zero_counts; # Hash to store counts of rows with specific numbers of zeros

# Read through each line of the file
while (my $line = <$fh>) {
    chomp $line;

    # Remove the last column (total count)
    my @fields = split(/\t/, $line);
    pop @fields;

    # Remove the first column (orthogroup name)
    shift @fields;

    # Count the zeros in the current line
    my $zero_count = grep { $_ == 0 } @fields;

    # Update the count in the hash
    $zero_counts{$zero_count}++;
}

close $fh;

# Print the results
for my $zeros (reverse 0 .. 17) {
    print "Rows with $zeros zero values: $zero_counts{$zeros}\n";
}

