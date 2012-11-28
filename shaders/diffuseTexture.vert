//A brutally simple vertex shader that just mimics exactly what OpenGL's default
//fixed pipeline does

void main() {                

    vec3 normal, lightDir;
    normal = normalize(gl_NormalMatrix * gl_Normal);
    lightDir = normalize(vec3(gl_LightSource[0].position));

    vec4 diffuse = gl_LightSource[0].diffuse*gl_FrontMaterial.diffuse*max(dot(normal, lightDir), 0.0);
    vec4 ambient = gl_FrontMaterial.ambient * gl_LightSource[0].ambient;
	vec4 globalAmbient = gl_LightModel.ambient * gl_FrontMaterial.ambient;

//    gl_FrontColor = diffuse + globalAmbient + ambient;
    gl_FrontColor = diffuse;

    gl_TexCoord[0] = gl_MultiTexCoord0;
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;

}
