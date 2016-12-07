# This is a basic VCL configuration file for varnish.  See the vcl(7)
# man page for details on VCL syntax and semantics.
# 
# Default backend definition.  Set this to point to your content
# server.
# 
vcl 4.0;
import fiftyonedegrees;

backend default {
	.host = "127.0.0.1";
	.port = "80";
}

sub vcl_recv {
	set req.http.X-IsMobile = fiftyonedegrees.match("IsMobile");
	set req.http.X-BrowserName = fiftyonedegrees.match("BrowserName");
	set req.http.X-PlatformName = fiftyonedegrees.match("PlatformName");
	set req.http.X-Difference = fiftyonedegrees.match("Difference");
	set req.http.X-Method = fiftyonedegrees.match("Method");
	set req.http.X-Rank = fiftyonedegrees.match("Rank");
	set req.http.X-DeviceId = fiftyonedegrees.match("DeviceId");
}

sub vcl_deliver {
	set resp.http.X-IsMobile = fiftyonedegrees.match("IsMobile");
	set resp.http.X-BrowserName = fiftyonedegrees.match("BrowserName");
	set resp.http.X-PlatformName = fiftyonedegrees.match("PlatformName");
	set resp.http.X-Difference = fiftyonedegrees.match("Difference");
	set resp.http.X-Method = fiftyonedegrees.match("Method");
	set resp.http.X-Rank = fiftyonedegrees.match("Rank");
	set resp.http.X-ID = fiftyonedegrees.match("DeviceId");
}

sub vcl_init {
	fiftyonedegrees.start("/home/ben/libvmod-fiftyonedegrees/data/51Degrees-LiteV3.2.dat");
}
