<template><!--on récupère les elements pour les afficher-->

    <div class="container">
        
        <figure>
            <img id="img_home" src="../img/logo_groupomania/icon-above-font.png" alt="Logo du groupe Groupomania" title="Groupomania">
        </figure>

        <a href="login" class="btn btn-danger btn-block max">Se connecter</a><br>
        <a href="register" class="btn btn-danger btn-block max">S'inscrire</a>
    </div>

</template>

<script>
    export default {
        name: 'home'
    }
</script>

<style>

h1, figure{
    margin: 0;
}

h1 {
    color: BLACK;
    margin-top: 20px;
}

#img_home{
    max-width: 280px;
   
    margin-top: 25px;
}

.max {
    max-width: 300px;
    margin: auto;
}

</style>