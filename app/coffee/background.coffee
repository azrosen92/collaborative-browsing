appState = { 
    commentThreads: [{
        id: 1,
        location: "#app > div > main > div > div > div._258j4 > h1",
        content: [{
            user: "Dave",
            comment: "Hi! I'm a comment."
        }, {
            user: "Sally",
            comment: "I'm a response to that comment."
        }]
    }]
    viewers: [{
        scrollPosition: 50
    }, {
        scrollPosition: 1500
    }]
}

chrome.runtime.onConnect.addListener (port) ->
    port.postMessage(appState)
    # window.setInterval () ->
    #     appState.viewers.push({
    #         scrollPosition: 50
    #     })

    #     port.postMessage(appState)
    # , 500