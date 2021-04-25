#!C:/Perl/bin/perl -w
require "cgi-lib.pl";
#use Escape;

MAIN:
{
    &ReadParse(*input);
    $a = $input{'classify'};
    $b = $input{'category'};
    $c = $input{'title'};

    #$a = 'Green Tea';
    #$b = '';
    #$c = '';
}

#$ignore='.com';
open(INPUT, "purchase.txt") or die "Can't open YO";



my $table;

open my $fh, '<', 'purchase.txt' or die "Can't open file $!";

my $file_content= do { local $/; <$fh> };
    
($table = $file_content) =~/(<table)[\s\S]*(\/td>)/;
$result=$&;

$stringInd = 0;

@entries=();
$endOfTable=length($result);
#print $endOfTable;
$first=1;
while($result =~/(<tr><td>)([\s\S]*?)(\/td><\/tr>)([\s\S]*?)(\/td><\/tr>)/){
    
    $stringStart;
    $currEntry;

    
    $currEntry = $&;
    $end=$+[1];    
  
    $total=$stringInd+length($currEntry);
   
    if($stringStart<$endOfTable){
        
        push(@entries,$currEntry);

        $result=substr($result,$end);
    }
       
    $stringInd=$end+1;
    
}

close(INPUT);

@matches=();

foreach(@entries){

    $foundA=0;
    $foundB=0;
    $foundC=0;

    if((index($_, $a) !=-1) | ($a eq '')){
       $foundA=1;
    }

    
    if((index($_, $b) !=-1) | ($b eq '')){
        $foundB=1;
    }

    if((index($_, $c) !=-1) | ($c eq '')){
        $foundC=1;
    }

    if($foundA && $foundB && $foundC){

        push(@matches,$_)

    } 

}

$output='';

foreach(@matches){  
    $output= join '',$output,' ',$_;
}




print<<ABCDE;
Content-Type: text/html; charset=utf-8



<html>
<head>
<style>
td {colspan: 5;
    align:right;
}

</style>
</head>
<body>
<table border=1 bgcolor=white>

$output

</table>
</body>
</html>

ABCDE
