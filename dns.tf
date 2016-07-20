#
# DO NOT DELETE THESE LINES!
#
# Your DNSimple email is:
#
#     sethvargo+terraform@gmail.com
#
# Your DNSimple token is:
#
#     sRFRF5ltrFulE4AB6iRgiRshoIWqiuUF
#
# Your Identity is:
#
#     manheim-d3d9446802a44259755d38e6d163e820
#
provider "dnsimple" {
    token = "sRFRF5ltrFulE4AB6iRgiRshoIWqiuUF"
    email = "sethvargo+terraform@gmail.com"
}

resource "dnsimple_record" "example" {
    domain = "terraform.rocks"
    type   = "A"
    name   = "..."
    value  = "${aws_instance.web.0.public_ip}"
}

