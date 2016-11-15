package SOFTLINK;
use Exporter;
@ISA = qw(Exporter);
use strict;


sub new {
	my $class = shift;
	my $self = { };
	bless ($self, $class);
	return $self;
}

sub CreateLink {
	my ($self, $hashref, $arrayref) = @_;
		
	my %hashtable=%$hashref;
	my @a=@$arrayref;
	
	foreach my $name (@a)
	{
	
		if(-e $hashtable{"customer ftp"}.$name)
		{
		
			print "FTP link already exists, If you want to continue please delete the existing link\n";
			exit;
		}
		`ln -s $hashtable{"datbase path"}$name $hashtable{"customer ftp"}`;
		`md5sum $name >> $hashtable{"customer ftp"}$hashtable{"md5sum name"}`;

	}
}
1;
