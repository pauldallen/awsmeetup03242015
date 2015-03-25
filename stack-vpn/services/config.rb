coreo_aws_ec2_securityGroups "${VPN_NAME}-elb-sg" do
  action :sustain
  description "Open vpn to the world"
  vpc "${VPC_NAME}"
  allows [ 
          { 
            :direction => :ingress,
            :protocol => :tcp,
            :ports => [1199,123,234,456],
            :cidrs => ${VPN_ACCESS_CIDRS},
          },{ 
            :direction => :egress,
            :protocol => :tcp,
            :ports => ["0..65535"],
            :cidrs => ${VPN_ACCESS_CIDRS},
          }
    ]
end
