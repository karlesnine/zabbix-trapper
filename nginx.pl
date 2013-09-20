#!/usr/bin/perl -w
#######################################
# Nginx combined plugin to measure in one graph:
# - Request /sec
# - Connection / sec
# - Request / connection
# - Active connections
# - Reading
# - Writing
# - Waiting
########################################

my $ret = undef;

if (! eval "require LWP::UserAgent;"){
        $ret = "LWP::UserAgent not found";
}

chomp(my $fqdn = `basename $0 | sed 's/^nginx_status_//g'`);

my $URL = "http://127.0.0.1/nginx_iscoolent_status";

#do requests
my $ua = LWP::UserAgent->new(timeout => 10);
my $response = $ua->request(HTTP::Request->new('GET',$URL));

#calculate responses
my $active   = 0;
my $reading  = 0;
my $writing  = 0;
my $waiting  = 0;
my $requests = 0;

foreach (split(/\n/, $response->content)) {
    $active = $1 if (/^Active connections:\s+(\d+)/);
    if (/^Reading:\s+(\d+).*Writing:\s+(\d+).*Waiting:\s+(\d+)/) {
        $reading = $1;
        $writing = $2;
        $waiting = $3;
    }
    $requests = $3 if (/^\s+(\d+)\s+(\d+)\s+(\d+)/);
}
print "- nginx.active $active\n- nginx.requests $requests\n- nginx.reading $reading\n- nginx.writing $writing\n- nginx.waiting $waiting";
