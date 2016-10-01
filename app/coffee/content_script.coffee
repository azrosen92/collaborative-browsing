ReactDOM = require 'react-dom'
React = require 'react'

UsersOnPage = React.createClass({
    displayName: 'UsersOnPage'

    render: ->
        <div>
        {
            ['top', 'middle', 'bottom'].map (position) =>
                <div className={"col-brows-#{position} col-brows-circle blue"} key=position>
                    <div className='centered'>
                        {@props.viewersAt[position]}
                    </div>
                </div>
        }
        </div>
})

ColBrowsContainer = React.createClass({
    displayName: 'ColBrowsContainer'
    getInitialState: -> 
        {
            viewers: []
        }

    render: ->
        positionData = { 'top': @usersAt('top'), 'middle': @usersAt('middle'), 'bottom': @usersAt('bottom') }

        <UsersOnPage viewersAt={positionData} />

    usersAt: (position) -> 
        scrollTop = window.scrollY
        scrollBottom = scrollTop + window.innerHeight

        viewersAtPosition = @state.viewers.filter (viewer) ->
            switch position
                when 'middle' then viewer.scrollPosition >= scrollTop && viewer.scrollPosition <= scrollBottom
                when 'top' then viewer.scrollPosition < scrollTop
                when 'bottom' then viewer.scrollPosition > scrollBottom
                else false

        viewersAtPosition.length

})

##
# State should look like
#    viewers: [{
#       viewerId: <number>,
#       scrollPosition: <number>,
#       mousePosition: {
#           x: <number>,
#           y: <number>,
#       }
#    }, ..., {}]
#
if document.body
    containerDiv = document.createElement('div')
    containerDiv.id = 'col-brows-container'
    document.body.appendChild(containerDiv)

    app = ReactDOM.render(
        <ColBrowsContainer />
        containerDiv
    )

    appState = { 
        viewers: [{
            scrollPosition: 50
        }, {
            scrollPosition: 1500
        }]
    }

    app.setState(appState)

    window.addEventListener 'scroll', (e) =>
        ticking = false

        if !ticking
            window.requestAnimationFrame () =>
                app.setState(appState)

        ticking = true

