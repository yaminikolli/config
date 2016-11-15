package GENERATEXLS;
use Exporter;
@ISA = qw(Exporter);
use strict;
use Spreadsheet::Read qw(ReadData);
use Spreadsheet::WriteExcel;

sub new {
	my $class = shift;
	my $self = { };
	bless ($self, $class);
	return $self;
}

sub GenerateXlsReport {
	my ($self, $readpath, $writepath, $hashref, $arrayref) = @_;
	my %hashtable = %$hashref;
	my @a = @$arrayref;
	my $workbook = Spreadsheet::WriteExcel->new($writepath);

	my $worksheet = $workbook->add_worksheet(0);

	my $refi=0;
	my $refj=0;

	if(-e $readpath)
	{ 
		my $book = ReadData ($readpath);

		my @rows = Spreadsheet::Read::rows($book->[1]);
		print "$#rows";

		foreach my $i (1 .. scalar @rows) 
		{
	
			foreach my $j (1 .. scalar @{$rows[$i-1]}) 	
			{
		
				$worksheet->write($i-1,  $j-1, $rows[$i-1][$j-1]);

				$refi=$i;

			}

		}
	}
	# Add a Format
	my $format = $workbook->add_format(border => 1);
	#must set wrap for CCB comments and Description
	$format->set_bold();




	$worksheet->write($refi,  0, $hashtable{"customer name"}, $format);
	foreach my $name (@a)
	{
		$worksheet->write($refi,  1, $hashtable{"datbase path"}.$name, $format);
		$refi++;
	}
	$refi--;
	$worksheet->write($refi,  2, $hashtable{"Date"}, $format);
	$worksheet->write($refi,  3, $hashtable{"customer ftp"},$format);


	 
	if(-e $readpath)
	{
		`rm $readpath`;
	}
	`mv $writepath $readpath`;
}
1;
