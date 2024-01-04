#!usr/bin/perl
use TAGtable;
open(FH,"invivo-test-genia.xml") or die "Cannot open file $!";
$outfile="simple_invivo-train-genia-tagged.xml";
open(WRITE,"+>$outfile");
@arr=<FH>;
foreach $line (@arr){

    if($line=~/<sentence>(.*)<\/sentence>/){
        	      $abs=$1;
         chomp($abs);
	        $abs=~s/\./ \./g;
	        $abs=~s/\,/ \,/g;
	        $abs=~s/\(/\( /g;
	        $abs=~s/\)/\ )/g;
	        $abs=~s/\-/\ - /g;
	        $abs=~s/\[/\ [ /g;
	        $abs=~s/\]/\ ]/g;
        #$abs=~s/\]/ \]/g;
        @modified_array=undef;
        @sent_arry=split(/\s/,$abs);
        foreach $word(@sent_arry){
		$normal_word=$word;
		$word = lc $word;
		#print $word,"\n";

            if($DRUG{$word}){
                $mst="<cons lex=\"$word\" sem=\"G_DRUG\">$normal_word</cons>";
                push(@modified_array,$mst);

            }
            #elsif($in_vitro{$word}){
	    #		    $mst="<cons sem=\"G_INVITPARA\">$normal_word</cons>";
	    #	                    push(@modified_array,$mst);
	    #		    
	   #}
            elsif($word=~/[0-9]\.[0-9]\.[0-9]/)
            {
                if($word=~/[a-z]/)
                {
                    if($cyps{$word}){
                        $mst="<cons lex=\"$word\" sem=\"G_CYP\">$normal_word</cons>";
                        push(@modified_array,$mst);
                    }
                    else{push(@modified_array,$normal_word);}

                }
                 else{
		
		                    push(@modified_array,$normal_word);
                }
            }
            elsif($word=~/[0-9]\.[0-9]%/)
            {
                if($word=~/[a-z]/){
                    if($cyps{$word}){
                        $mst="<cons lex=\"$word\" sem=\"G_CYP\">$normal_word</cons>";
                        push(@modified_array,$mst);
                    }
                    else{push(@modified_array,$normal_word);}
                }
                 else{
		
		                    push(@modified_array,$normal_word);
                }
            }
            elsif($word=~/[0-9][0-9]\.[0-9]/)
            {
                if($word=~/[a-z]/){
                    if($cyps{$word}){
                        $mst="<cons lex=\"$word\" sem=\"G_CYP\">$normal_word</cons>";
                        push(@modified_array,$mst);
                    }
                    else{push(@modified_array,$normal_word);}
                }
                 else{
		
		                    push(@modified_array,$normal_word);
                }
            }
            elsif($word=~/[^a-z^][0-9]/)
            {
                if($word=~/[a-z]/){
                    if($cyps{$word}){
                        $mst="<cons lex=\"$word\" sem=\"G_CYP\">$normal_word</cons>";
                        push(@modified_array,$mst);
                    }
                    else{push(@modified_array,$normal_word);}
                }
                 else{
		
		                    push(@modified_array,$normal_word);
                }
            }
            elsif($word=~/[0-9][0-9][0-9]\.[0-9]/)
            {
                if($word=~/[a-z]/)
                {
                    if($cyps{$word}){
                        $mst="<cons lex=\"$word\" sem=\"G_CYP\">$normal_word</cons>";
                        push(@modified_array,$mst);
                    }
                    else{push(@modified_array,$normal_word);}
                }
                 else{
		
		                    push(@modified_array,$normal_word);
                }
            }
            elsif($word=~/[0-9]/)
            {
                if($word=~/[a-z]/){
                    if($cyps{$word}){
                        $mst="<cons lex=\"$word\" sem=\"G_CYP\">$normal_word</cons>";
                        push(@modified_array,$mst);

                    }
                    else{push(@modified_array,$normal_word);}
                }
                else{

                    push(@modified_array,$normal_word);
                }
            }
            elsif($cyps{$word}){
                $mst="<cons lex=\"$word\" sem=\"G_CYP\">$normal_word</cons>";
                push(@modified_array,$mst);
            }
           # elsif($relationship{$word}){
	   #                 $mst="<cons sem=\"G_RELATIONSHIP\">$normal_word</cons>";
	   #                 push(@modified_array,$mst);
           # }
           # elsif($change{$word}){
	   # 	                    $mst="<cons sem=\"G_CHANGE\">$normal_word</cons>";
	   # 	                    push(@modified_array,$mst);
           # }
            else{
                push(@modified_array,$normal_word);
            }



        } 
        $mod_str=join(" ",@modified_array);
        $mod_str=~s/ \./\./g;
        $mod_str=~s/ \,/\,/g;
        $mod_str=~s/ \- /\-/g;
        $mod_str=~s/ \)/\)/g;
        $mod_str=~s/\( /\(/g;
        $mod_str=~s/\[ /\[/g;
        $mod_str=~s/\ ]/\]/g;
        print WRITE"<sentence>$mod_str</sentence>\n";

    }
    else{
        print WRITE $line;
        print $line;
    }



}
