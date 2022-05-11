const router = require('express').Router(); // Express module router
const userCtrl = require('../controllers/users'); // Chemin pour les fonctions userCtrl
const auth = require('../middleware/auth'); // Chemin pour vérifier l'auth

try {
   router.post("/register", userCtrl.signup); // Route vers la création d'un compte
   router.post("/login", userCtrl.login); // Route vers la connexion
   router.put("/profil", auth, userCtrl.modifyUser); // route vers la modif profil
   router.get('/profil', auth, userCtrl.getProfil); // route vers l'affichage du profil
   router.delete("/profil", auth, userCtrl.deleteProfil); // route vers la  suppression d'un profil 
} catch (err) {
    console.log("Erreur de route > Login/SignUp/ModifyUser/GetProfil/DeleteProfil");
}

module.exports = router;