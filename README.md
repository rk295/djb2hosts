djb2hosts
=========

Quick script to read in a [Tinydns](http://tinydns.org/) format file and output a /etc/hosts format file.

Simply reads STDIN, use like:

<pre>
% ./djb2hosts.pl < tinydns-format-zone-file
</pre>

Will output on stdout a file of the format:

<pre>
1.2.3.4    bart
6.7.8.9    homer, pieman
etc.
</pre>

It putputs some diagnostics to STDERR, so you'll want to redirect that somewhere. I used:

<pre>
% ./djb2hosts.pl < tinydns-format-zone-file > hosts.file
</pre>

The tinydns file format is documented [here](http://cr.yp.to/djbdns/tinydns-data.html). The script currently throws away anything that isn't a A or a CNAME record.