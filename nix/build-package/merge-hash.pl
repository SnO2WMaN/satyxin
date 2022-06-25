my @lines;
while (my $line = <>) {
    chomp $line;
    $line =~ s/^\s+//;

    if ($line eq "{") { next; }
    if ($line eq "}") { next; }
    if ($line =~ /,$/) { chop($line); push @lines, $line; }
    else { push @lines, "$line"; }
}

print "{\n";
for (my $i = 0; $i < @lines; $i++) {
    if ($i == @lines - 1) { print "\t", $lines[$i], "\n"; }
    else { print "\t", $lines[$i], ',', "\n"; }
}
print "}\n";
