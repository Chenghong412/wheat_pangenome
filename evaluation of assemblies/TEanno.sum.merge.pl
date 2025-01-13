#!/usr/bin/perl-w
############Cheng Hong###########
use strict;
use Data::Dumper;
die  "Usage: $0 <filelist> <output> <samplename>\n" unless (@ARGV == 3);
open IN, "$ARGV[0]" or die "total table required!\n";
open OUT, ">$ARGV[1]" or die "permission denied!\n";


#tmp 不同基因组注释出的TE种类可能不同，行数会变，需注意
#Repeat Classes
#==============
#Total Sequences: 1
#Total Length: 590424708 bp
#Class                  Count        bpMasked    %masked
#=====                  =====        ========     =======
#LTR                    --           --           --   
#    Copia              70107        101043257    17.11% 
#    Gypsy              179112       206883241    35.04% 
#    unknown            177077       122351760    20.72% 
#TIR                    --           --           --   
#    CACTA              30301        15458438     2.62% 
#    Mutator            12965        4498052      0.76% 
#    PIF_Harbinger      7863         3775643      0.64% 
#    Tc1_Mariner        41035        13479659     2.28% 
#    hAT                2254         707424       0.12% 
#nonLTR                 --           --           --   
#    LINE_element       2586         2114018      0.36% 
#nonTIR                 --           --           --   
#    helitron           15552        9187036      1.56% 
#repeat_region          78943        34160570     5.79% 
#                      ---------------------------------
#    total interspersed 617795       513659098    87.00%
#
#---------------------------------------------------------
#Total                  617795       513659098    87.00%


my @TE=("Copia","Gypsy","TRIM","unknown","CACTA","Mutator","PIF_Harbinger","Tc1_Mariner","hAT","LINE_element","SINE_element","helitron");
my $genome;
my %count;
my %length;
my %masked;
while(<IN>){
	my $line;
	my $type;
	chomp;
	open(temp, $_)or die "$_ file missing!\n";
	while(<temp>){
		chomp;
		$line+=1;
		my $chr;
		if($line==4){
			($chr)=$_=~/Total Length: (\S+?)\s/;
			$genome+=$chr;
		}
		if($line>6){
			my @tmp=split/\s+/,$_;
			if($tmp[1] eq "--"){
				$type=$tmp[0];
				#print $tmp[0],"\n";
			}
	    	elsif(grep /$tmp[1]/, @TE){
	    		#print $type,"\n";
	    		$count{$type}{$tmp[1]}+=$tmp[2];
	    		$length{$type}{$tmp[1]}+=$tmp[3];
	    		my ($percentage)=$tmp[4]=~/(\S+?)\%/;
	    		$masked{$type}{$tmp[1]}+=$percentage;
	   			#print $type,"\t",$tmp[1],"\t",$tmp[2],"\t",$tmp[3],"\t",$percentage,"\n";
	  		}	
	   		elsif($tmp[0] eq "repeat_region"){
	    		$count{$tmp[0]}{$tmp[0]}+=$tmp[1];
	    		$length{$tmp[0]}{$tmp[0]}+=$tmp[2];
	    		my ($percentage)=$tmp[3]=~/(\S+?)\%/;
	    		$masked{$tmp[0]}{$tmp[0]}+=$percentage;
	   			#print "repeat_region","\t",$tmp[0],"\t",$tmp[1],"\t",$tmp[2],"\t",$percentage,"\n";
	   			last;
	   		}	  				
	   		elsif($_ =~/-----------------/){
	   			last;
	   		}
	   	}
	}
}


my ($total_count,$total_length,$total_masked);
my $sample=$ARGV[2];
foreach my $big(keys %count){
	foreach my $small(keys %{$count{$big}}){
		$total_count+=$count{$big}{$small};
		$total_length+=$length{$big}{$small};
		$total_masked+=$masked{$big}{$small};
		print OUT $sample,"\t",$big,"\t",$small,"\t",$count{$big}{$small},"\t",$length{$big}{$small},"\t",$length{$big}{$small}/$genome,"\n";
	}
}

print OUT $sample,"\t","total","\t",$genome,"\t",$total_count,"\t",$total_length,"\t",$total_length/$genome,"\n";


=pod
		if($line>6){
	   		my @tmp=split/\s+/,$_;
	  		if($tmp[0]=="" && $tmp[0] ne "repeat_region"){
	    		$count{$tmp[1]}+=$tmp[2];
	    		$length{$tmp[1]}+=$tmp[3];
	    		my ($percentage)=$tmp[4]=~/(\S+?)\%/;
	    		$masked{$tmp[1]}+=$percentage;
	   			print $tmp[1],"\t",$tmp[2],"\t",$tmp[3],"\t",$percentage,"\n";
	  		}	
	   		if($tmp[0] eq "repeat_region"){
	    		$count{$tmp[0]}+=$tmp[1];
	    		$length{$tmp[0]}+=$tmp[2];
	    		my ($percentage)=$tmp[3]=~/(\S+?)\%/;
	    		$masked{$tmp[0]}+=$percentage;
	   			print $tmp[0],"\t",$tmp[1],"\t",$tmp[2],"\t",$percentage,"\n";
	   			last;
	   		}
=cut
