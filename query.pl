#!C:/Perl/bin/perl -w
require "cgi-lib.pl";
#use Escape;
MAIN:
{
    &ReadParse(*input);
    $a = $input{'classify'};
    $b = $input{'category'};
    $c = $input{'title'};
}
$result='';
#$ignore='.com';
open(INPUT, "purchase.txt") or die "Can't open YO";

<>;
while (<INPUT>) {
    
    if (/$a/) {
        $currLine=$_;
        if($currLine =~ /$b/){
            if($currLine =~ /$c/){
                $result= join '',$result,'<br>',substr $_, 39;
                print $result;
            }
        }
    }




        
}

close(INPUT);

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
<table>

$result

</table>
</body>
<html>

ABCDE
