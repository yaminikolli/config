package OPENFILE;
use Exporter;
@ISA = qw(Exporter);
use strict;
use Switch;
use File::Basename;




sub new {
	my $class = shift;
	my $self = { };
	bless ($self, $class);
	return $self;
}

sub OpenFile{
	my ($self, $filepath) = @_;
	my %hashtable;
	my @a;	
	
	open(FH,"<$filepath")||die($!);
	while(my $string=<FH>) {
		chomp($string);
	
		my @arr= split /:/, $string;	
		if($#arr==0)
		{
			print "enter Config file correctly and TRY AGAIN\n";
			exit;
		}
		
		$hashtable{$arr[0]}=$arr[1];
		if($arr[0] eq "IP Requested")
		{
			@a = split /,/ , $arr[1];
				
		}
	
	}
	close(FH);
	
	return (\%hashtable, \@a);
}
1;
