<template><!--on récupère les elements pour les afficher-->
    <nav class="navbar navbar-expand navbar-light fixed-top">
      <div class="container"> 
        <a href="http://localhost:8080/" class="navbar-brand" title="Retourner sur la page d'accueil">Accueil</a>
        <div class="collapse navbar-collapse">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a href="#" v-if="userId != null" @click="deco()" class="nav-link" title="Se déconnecter">Deconnexion</a>
            </li>
            <li class="nav-item">
              <a href="groupomania" v-if="userId != null" class="nav-link" title="A">Publications</a>
            </li>
            <li class="nav-item">
              <a href="login" v-if="userId === null" class="nav-link" title="Connectez-vous ici">Connexion</a>
            </li>
            <li class="nav-item">
              <a href="register" v-if="userId === null" class="nav-link" title="S'insrire chez Groupomania">S'inscrire</a>
            </li>
          </ul>
        </div> 
      </div>
     </nav>
</template>

<script>
  export default {
    name: 'navi',
    data() {
      return {
        userId: localStorage.userId
      }
    },
    methods: { //on déclare des fonctions qui prennent des paramètres
      deco() {
        console.log("Deconnexion");
        localStorage.clear();
        this.$router.push('/');
        location.reload();
      }
    }
  }
</script>

<style>

.nav-item a {
  color:#e40f0f!important;
  font-weight: bold;
}

.nav-item a:hover {
  color: rgb(85, 85, 85)!important;
  transition: .5s;
}

.navbar-brand {
  color:#e40f0f!important;
}
</style>