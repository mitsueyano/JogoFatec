image_alpha -= fadeSpeed;

// Garante que o valor não passe de 0
image_alpha = max(image_alpha, 0); 

if (image_alpha <= 0) {
    instance_destroy();
}