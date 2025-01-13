#!/bin/usr/perl -w
#
my $file =shift;
my $file2=shift;
my $ref ;

open IN,$file or die $!;
while(<IN>){
    chomp;
    my($id)=$_;
    $ref -> {$id}=1;

}
open IN2,$file2 or die $!;
while(<IN2>){
        chomp;
        my($id)=split(/\t/,$_);
        if(defined $ref -> {$id}){
        print "$_\n";           
        }
}




