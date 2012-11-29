//A brutally simple vertex shader that just mimics exactly what OpenGL's default
//fixed pipeline does
uniform float currentTime;

void main() {

    vec3 normal, lightDir;
    normal = normalize(gl_NormalMatrix * gl_Normal);
    lightDir = normalize(vec3(gl_LightSource[0].position));

    vec4 diffuse = gl_LightSource[0].diffuse*max(dot(normal, lightDir), 0.0);
    vec4 ambient = gl_LightSource[0].ambient;

    gl_FrontColor = diffuse + ambient;

    float r = currentTime*0.3;
    // [ cos(r) -sin(r) ] [mtc0.x]
    // [ sin(r)  cos(r) ] [mtx0.y]
    float cx = gl_MultiTexCoord0.s;
    float cy = gl_MultiTexCoord0.t;
    gl_TexCoord[0] = vec4( cos(r)*cx - sin(r)*cy, sin(r)*cx + cos(r)*cy, 0.0, 0.0 );
    
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
}
