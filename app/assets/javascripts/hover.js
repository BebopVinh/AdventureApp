document.addEventListener("turbolinks:load", function() {
    $(function () {
    console.log("LOADED: hover.js")
    listenForAction()
    });

function listenForAction() {
    // if User hovers over button, flashIndex()
        // $('a.nav').on("mouseover", function (event) {
        //         event.preventDefault()
        //         // debugger
        //         $('div#drop_down').remove()
        //         var index_name = this.id
        //         flashIndex(index_name)
        // })      

    // Else, User clicks button, showIndex()
            $("li.nav").on("click", function (event) {
                event.preventDefault()
                // debugger
                // $(content).
                var index_name = this.id
                showIndex(index_name)
            })
        }      


function flashIndex(index_name) {
    $.ajax({
        url:`http://localhost:3000/${index_name}`,
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log("This index contains: ", data)
        document.getElementsByClassName("wrapper")
        // debugger
        //We wouldn't want to make an index model, unless it speeds things up?
        // let myAdventure = new Adventure(data)
        let thisIndexView;


        // replace current wrapper div with Index!
        // $(`div.wrapper`) = thisIndexView
        
    })
}

function showIndex(index_name) {
    $.ajax({
        url:`http://localhost:3000/${index_name}`,
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log("This index contains: ", data)
        let content = ""
        data.forEach(function (franchise) {
            content += `<div id="${franchise.id}"><a>${franchise.name}</a></div>`
        })

        //We wouldn't want to make an index model, unless it speeds things up?
        // let myAdventure = new Adventure(data)
        // let thisIndexView;


        // replace current wrapper div with Index!
        $(`div.wrapper`).html(content)
    })
}

class Index {
    constructor(obj) {
        // debugger
        this.id = obj.id
        this.name = obj.name
        this.location = obj.location
    }
}

})

