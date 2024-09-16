float map(vec3 p){
  return length(p) - .8;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
  vec2 uv = fragCoord / iResolution.xy;
  vec2 q = uv - vec2(.3,.7);
  vec3 col = mix(vec3(1.,.4,.1) , vec3(1.,.9,.3) , uv.y);
  float r = .2 + .1*cos(atan(q.y/q.x)*10. +q.x*20.);

  col *= smoothstep(r , r + .01 , length(q));

  r = .015;
  r += 0.002*cos(q.y *150.);
  r += 0.00000000000001*exp(q.y * -50.);

  col *=1.- (1. - smoothstep(r , r + .005 , abs(q.x + -.13*sin(q.y*3.)) )) * smoothstep(0.1, 0.1, -(q.y));
  fragColor = vec4(col,1.);
}

