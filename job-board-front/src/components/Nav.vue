<template>
  <nav class="navbar navbar-expand-md">
    <div class="container-fluid">
      <RouterLink to="/">
        <img src="../assets/LogoViteFaitSansFond.png" alt="">
      </RouterLink>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="mynavbar">
        <ul class="navbar-nav me-auto">
          <RouterLink to="/search-adverts">
            <li class="nav-item">
              <a class="nav-link" href="#" id="navRecherche" style="color:white">Offres d'emploi</a>
            </li>
          </RouterLink>
          <RouterLink to="/my-adverts">
            <li class="nav-item">
              <a class="nav-link" href="#" id="navCréer" style="color:white">Créer mon offre d'emploi</a>
            </li>
          </RouterLink>
        </ul>
      <div v-if="this.$store.state.myUserId < 0">
        <RouterLink to="/connexion"><button class="btn btn-primary" id="login" type="button">Sign in</button>
        </RouterLink>
        <RouterLink to="/Signup"><button class="btn btn-primary" id="signup" type="button">Sign up</button></RouterLink>
      </div>
      <div v-else>
        <RouterLink to="/MyProfile"><button class="btn btn-primary" id="login" type="button">Mon Profil</button></RouterLink>
      </div></div>
    </div>
  </nav>
</template>

<script>

export default {
  name: "Nav",
};
</script>

<style scoped>
nav{
  background-color: #303245;
  color: white;
}
#login {
  margin: 20px;
  background: linear-gradient(140deg,
      #42c3ca 0%,
      #42c3ca 50%,
      #42c3cac7 75%) !important;
  border: 0;
}

#signup {
  background: linear-gradient(140deg,
      #616969 0%,
      #656969 50%,
      #696969 75%);
  border: none;
}
a{
text-decoration: none;
font-size: 20px;
margin-left: 10px;
transition: 1s;
}
a:hover{
  font-size: 30px;
  transition: 1s;
}
img {
  width: 70px;
  height: 70px;
}
</style>