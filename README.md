djb2hosts
=========

Quick script to read in a [Tinydns](http://tinydns.org/) format file and output a /etc/hosts format file.

Simply reads STDIN, use like:

```
% ./djb2hosts.pl < tinydns-format-zone-file
```

Will output on stdout a file of the format:

```
1.2.3.4    bart
6.7.8.9    homer, pieman
etc.
```

It putputs some diagnostics to STDERR, so you'll want to either redirect that somewhere, or push STDOUT to a file. I used:

```
% ./djb2hosts.pl < tinydns-format-zone-file > hosts.file
```

Tinydns documentation
---------------------

The tinydns file format is documented [here](http://cr.yp.to/djbdns/tinydns-data.html). The script currently throws away anything that isn't a A or a CNAME record.