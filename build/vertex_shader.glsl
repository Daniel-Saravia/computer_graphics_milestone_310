// Specifies the version of GLSL to use. "330 core" means version 3.3 in core profile.
#version 330 core

// Input vertex attributes. These are set from the OpenGL application.
layout (location = 0) in vec3 aPos;   // Vertex position attribute. Expected to be provided by the application.
layout (location = 1) in vec3 aColor; // Vertex color attribute. Expected to be provided by the application.

// Uniforms are parameters that are the same for all vertices processed by the shader program.
uniform mat4 model;      // Model matrix used to transform vertex positions from model space to world space.
uniform mat4 view;       // View matrix used to transform vertex positions from world space to camera space.
uniform mat4 projection; // Projection matrix used to transform vertex positions from camera space to clip space.

// Output variable for passing the vertex color to the next stage in the pipeline (e.g., the fragment shader).
out vec3 ourColor;

// The main function of the shader, which is executed for each vertex.
void main()
{
    // Calculate the position of the vertex. The vertex's position is transformed by the model, view,
    // and projection matrices in order to place it correctly in the scene according to the world's,
    // camera's, and projection's settings. The multiplication order is important and is done in reverse
    // order of how you might expect because matrix multiplication is not commutative.
    gl_Position = projection * view * model * vec4(aPos, 1.0);

    // Pass the vertex's color to the next stage in the pipeline without modification.
    ourColor = aColor;
}


