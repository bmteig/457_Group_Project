#!C:/Perl/bin/perl -w
require "cgi-lib.pl";
#use Escape;

MAIN:
{
    &ReadParse(*input);
   # $a = $input{'classify'};
   # $b = $input{'category'};
   # $c = $input{'title'};

    $a = "Green";
    $b = "Sencha";
    $c = "Organic";
}

#$ignore='.com';
open(INPUT, "purchase.txt") or die "Can't open YO";

#<>;
#$/=eof123;
# while (<INPUT>) {
#     #next if $.==1;
#     print "HELOOO";

#     if($_=~/^(.*?) > (.*?) > (.*?) </)
#     {
#        # $result= join '',$result,'<br>',$_;

       
#        if ($_=~/$a/) {
#         $currLine=$_;
#         if($currLine =~ /$b/){
#             if($currLine =~ /$c/){
#                 $result= join '',$result,'<br>',substr $_, 39;
#                 #print $result;
#             }
#         }
#     }
#     }

   




        
# }


my $table;

open my $fh, '<', 'purchase.txt' or die "Can't open file $!";

my $file_content= do { local $/; <$fh> };
    
($table = $file_content) =~/(<table)[\s\S]*(\/td>)/;
$result=$&;


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


$result


</body>
<html>

ABCDE
