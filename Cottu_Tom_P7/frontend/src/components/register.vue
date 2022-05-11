<template><!--on récupère les elements pour les afficher-->
    <div class="connexion">
        <h3>Inscription</h3>
        <p v-if="message != null"> {{ message }}</p>
        <p v-if="email.length >= 5 && password.length >= 5 && name.length >= 2">
            <ul>
                <li v-for="(error, ok) in errors" v-bind:key="ok">{{ errors[ok] }}</li> <!--transmet des données de chaques post aux components-->
            </ul>
        </p>
        <div class="form-group">
            <label>Pseudo</label> 
            <input @keyup="checkForm" type="text" class="form-control" label="name" :counter="5" v-model="name" placeholder="Monsieur Test" minlength="2" maxlength="25" required/>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input @keyup="checkForm" type="email" class="form-control" label="email" v-model="email" placeholder="Adresse mail" minlength="5" maxlength="45" required/>
        </div>

        <div class="form-group">
            <label>Mot de passe</label>
            <input @keyup="checkForm" type="password" class="form-control" label="password" v-model="password" placeholder="Mot de passe" minlength="7" maxlength="45" required/>
        </div>

        <button class="btn btn-success btn-block" :disabled="inscription === false" @click="registerSubmit">Je m'inscris sur Groupomania</button>
        <a href="http://localhost:8080/" class="btn btn-dark btn-block">Retourner à l'accueil</a>
    </div>
</template>

<script>
export default {
    name: 'register',
    data() {
        return {
            errors: [],
            name: '',
            email: '',
            message: '',
            password: '',
            inscription: false
        }
    },
    methods: {
        checkForm:function(e) {
            this.errors = [];
            if (this.errors.length === 0) { this.inscription = true; console.log(this.inscription + "/" + this.errors.length)}
            if(!this.email) {
                this.errors.push("L'email est obligatoire ");
                this.inscription = false;
            } else if (!this.validEmail(this.email)) {
                this.errors.push("L'email n'est pas bon");
                this.inscription = false;
            }
            if(!this.name) {
                this.errors.push("Nom obligatoire ");
                this.inscription = false;
            } else if (!this.validName(this.name)) {
                this.errors.push("Nom incorrect")
                this.inscription = false;
            }
            if (!this.password) {
                this.errors.push("Le mot de passe est obligatoire ");
                this.inscription = false;
            }
            if (!this.validPassword(this.password)) {
                this.errors.push("Le mot de passe doit contenir 8 caractères, une majuscule puis chiffre.");
                this.inscription = false;
            }
            if(!this.errors.length) return true;
                e.preventDefault();//Modif du post avc mise en att avant la récup des données
            },
            validEmail:function(email) {
                this.email = email;
                let re = /^(([^<>()\]\\.,;:\s@"]+(\.[^<>()\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(email);
            },
            validPassword:function(pass) {
                this.password = pass;
                let rePass = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
                return rePass.test(pass);
            },
            validName:function(name) {
                this.name = name;
                let reName = /^[a-z ,.'-]+$/i;
                return reName.test(name);
            },
        registerSubmit(){
            const data = {
                name: this.name,
                email: this.email,
                password: this.password
            }
            fetch('http://localhost:3000/register', {
                method: "POST", body: JSON.stringify(data), headers: {"Content-type": "application/json; charset=UTF-8"}
            }).then(response => { 
                console.log(response);
                this.$router.push('/login');
            })
            .catch(err => this.message = err);
        }
    }
}
</script>

<style>
