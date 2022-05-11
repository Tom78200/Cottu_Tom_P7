<template>
    <div class="post">
        <article v-for="(post, listPost) in allPosts" v-bind:key="listPost"> <!-- la directive v-for pour faire le rendu d’une liste d’éléments-->
        <div class="top-comment">
            <h4><a class="profil-clic" href="#" title="Auteur du post">{{ post.name }} {{ post.id }}</a></h4>
            <h5 title="Date et heure de la création du post">Le {{ post.date }} à {{ post.time }}</h5>
        </div>
        <p class="post-text">{{ post.text }}</p>
        <div class="section-comment">                                       <!--La directive v-if est utilisée pour conditionnellement faire le rendu d’un bloc.-->
            <p class="alert-text" v-if="comment.text.length >= 1"> {{ errors[0] }}</p>
            <div class="sendText" v-if="disabled == false || id == post.id" >
                <textarea :id="post.id" type="text" v-model="comment.text" minlength="3" maxlength="80" class="comment" @click="checkId" @keyup="checkForm" @focus="id = post.id" placeholder="Cliquez ici pour commenter" required/>
                <button class="btn btn-success btn-sm" title="Envoyer un commentaire" :disabled="canComment == false" @click="createComment(post.id)">Envoyer</button>
            </div>                                                                   
        </div>
        <button @click="afficherCom(post.id)" class="btn btn-dark btn-sm btn-comment" title="Afficher les commentaires sous ce post">Commentaires</button>
        <button @click="disabled = false" v-if="disabled == true" class="btn btn-dark btn-sm btn-comment commenter" title="Commenter ce post">Commenter</button>
        <div class="users-comment" v-for="(comment, listComment) in allComments" v-bind:key="listComment">
            <div v-if="post.id == comment.postid">
                <h6>{{ comment.name }} le {{ comment.date }} <button title="suppr le commentaire" class="btn btn-outline-danger btn-sm" @click="deleteComment(comment.id)" v-if="comment.userId == userId || admin == 1"><i class="fas fa-trash"></i></button></h6>
                <p class="unique-com">{{ comment.text }}</p>
            </div>
        </div>
        <div class="moderation" v-if="post.userId == userId || admin == 1">
            <button class="btn btn-outline-danger modo-btn btn-sm" title="SUPPRIMER LE POST" @click="deletePost(post.id)"><i class="fas fa-trash"></i></button>
        </div>
        </article>
        <p class="no-connect" v-if="userId == null">Vous devez être connecté</p>
    </div>
</template>

<script>
import axios from "axios"
export default{
    name: 'post',
    data() {
        return {
            userId: "",
            userName: "",
            admin: "",
            allPosts: [],
            allComments: [],
            text: "",
            postId: "",
            commentId: "",
            canComment: false,
            errors: [],
            id: "",
            disabled: false,
            verifUser: {
                userId: ""
            },
            comment: {
                id: "",
                text: "",
                userId: "",
                name: ""
            },
            dataComment: "",
        }
    },
    methods: {
        checkId:function() {
            console.log(this.id);
            this.disabled = true;
        },
getPosts(){
axios.get("http://localhost:3000/groupomania", {headers: {Authorization: 'Bearer ' + localStorage.token}})
        .then(response => {
            this.allPosts = JSON.parse(response.data);
            console.log(this.allPosts);
        });

},

        checkForm:function(e) {
            this.errors = [];
            if (this.errors.length == 0) { 
                this.canComment = true; console.log(this.canComment + "/" + this.errors.length)
            }
            if(!this.comment.text) { //Si il n'y'a aucun texte d'entré
                this.errors.push("Un texte est obligatoire"); 
                this.canComment = false;
            } else if (!this.validComment(this.comment.text)) {
                this.errors.push("");
                this.canComment = false;
            }
            if(!this.errors.length) return true;
            e.preventDefault(); //Modif du post avc mise en att avant la récup des données
        },
        validComment:function(isValidCom) {
            this.comment.text = isValidCom;
            let re = /^[\s\S]{3,80}/; //On demande minimum 3 caractères pour un commentaire
            return re.test(isValidCom);
        },
        deletePost(pId){
            this.postId = pId;
            axios.delete("http://localhost:3000/groupomania/" + pId, {headers: {Authorization: 'Bearer ' + localStorage.token}})
            .then(() => {
               
                this.getPosts();
            })
            .catch(error => {
                console.log(error);
            })
        },
        createComment(pId){
            this.postId = pId;
            this.dataComment = JSON.stringify(this.comment);
            axios.post("http://localhost:3000/groupomania/" + pId + "/com", this.dataComment, {headers: {'Content-Type': 'application/json', Authorization: 'Bearer ' + localStorage.token}})
            .then(() => {
                this.afficherCom(pId);
            })
            .catch(error => {
                console.log(error); 
                this.message=error;
            });
        },
        afficherCom(pId) {
            
            axios.get("http://localhost:3000/groupomania/" + pId + "/com", {headers: {Authorization: 'Bearer ' + localStorage.token}})
            .then(response => {
                console.log("Afficher commentaires.");
                this.allComments = JSON.parse(response.data);
                console.log(this.allComments);
            })
            .catch(error => {
            console.log(error);
            });
        },
        deleteComment(comId) {
            
            axios.delete("http://localhost:3000/groupomania/com/" + comId, {headers: {Authorization: 'Bearer ' + localStorage.token}})
            .then(() => {
                this.afficherCom();
            })
            .catch(error => {
                console.log(error);
            })
        }
    },
    mounted() {
        this.getPosts();
        axios.get("http://localhost:3000/profil", {headers: {Authorization: 'Bearer ' + localStorage.token}})
        .then(response => {
            let dataProfil = JSON.parse(response.data);
            this.comment.name = dataProfil[0].name;
            this.userName = dataProfil[0].name;
            this.admin = dataProfil[0].admin;
            this.userId = dataProfil[0].id;
            this.verifUser = dataProfil[0].id;
            this.comment.userId = dataProfil[0].id;
            localStorage.userName = dataProfil[0].name;
        })
        .catch(error => {
            console.log("Impossible de traiter les données du profil" + error);
        })
    }
}
</script>

<style>



article {
    margin-bottom: 20px;
    background: rgb(248, 248, 248);
   
    padding: 5px;
    border-radius: 10px;
}

h4, h5 {
    margin: 0;
    margin-left: 5px;
    margin-top: 35px;
}

.profil-clic {
    color: rgb(0, 0, 0);
}

.profil-clic:hover {
    text-decoration: none;
    color: rgb(214, 170, 218);
    transition: .5s;
}

.post-text {

    padding: 45px;
    overflow: hidden;
    word-wrap: break-word;

}

.top-comment {
    align-items: center;
    justify-content: space-around;
    margin-bottom: 15px;
}

.section-comment {
    display: flex;
    margin-top: 15px;
}



.comment {
    width: 90%;
    min-height: 35px;
    border-radius: 5px;
    margin-right: 30px;
}

.users-comment {
    border-radius: 10px;
}

.unique-com {
    margin: 0;
}

.reaction-modo, .dislike-block {
    display: flex;
    justify-content: center;
}

.moderation {
    display: flex;
    flex-direction: row;
}



.btn-secondary {
    margin-right: 10px;
}

.btn-comment {
    margin-bottom: 10px;
}

.no-connect {
    font-weight: bold;
    color: red;
}

.commenter {
    margin-left: 5px;
}

</style>