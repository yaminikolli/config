#! /usr/bin/perl

use lib "modules";
use OPENFILE;
use SOFTLINK;
#use GENERATEXLS;
use strict;
use Switch;
use File::Basename;


#use Spreadsheet::Read qw(ReadData);
#use Spreadsheet::WriteExcel;

my $filehandler_obj = new OPENFILE;
my $linkhandler_obj = new SOFTLINK;
#my $xlshandler_obj = new GENERATEXLS;

my ($hashref, $arrayref) = $filehandler_obj->OpenFile("/home/kyamini/Desktop/IV/IPQA_SCRIPTS/config");
$linkhandler_obj->CreateLink($hashref, $arrayref);
#$xlshandler_obj->GenerateXlsReport("/home/kyamini/Desktop/ta/repo.xls", "/home/kyamini/Desktop/ta/repo1.xls", $hashref, $arrayref);
