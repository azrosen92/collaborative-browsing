ReactDOM = require 'react-dom'
React = require 'react'

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
UsersOnPage = React.createClass({
    displayName: 'UsersOnPage'
    getInitialState: ->
        {
            viewers: []
        }

    render: ->
        <div>
        {
            ['top', 'middle', 'bottom'].map (position) =>
                <div className={"col-brows-#{position} col-brows-circle blue"} key=position>
                    <div className='centered'>
                        {@usersAt(position)}
                    </div>
                </div>
        }
        </div>

    usersAt: (position) -> 
        scrollTop = window.scrollY
        scrollBottom = scrollTop + window.innerHeight

        viewersAtPosition = @state.viewers.filter (viewer) ->
            switch position
                when "middle" then viewer.scrollPosition >= scrollTop && viewer.scrollPosition <= scrollBottom
                when 'top' then viewer.scrollPosition > scrollTop
                when 'bottom' then viewer.scrollPosition < scrollBottom
                else false

        viewersAtPosition.length
})

ColBrowsContainer = React.createClass({
    displayName: 'ColBrowsContainer'

    render: ->
        <UsersOnPage />
})

if document.body
    containerDiv = document.createElement('div')
    containerDiv.id = 'col-brows-container'
    document.body.appendChild(containerDiv)

    ReactDOM.render(
        <ColBrowsContainer position='middle'/>
        containerDiv
    )