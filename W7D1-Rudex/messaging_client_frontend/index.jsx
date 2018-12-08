import React from 'react';
import ReactDOM from 'react-dom';
import { HashRouter, Route, Switch } from 'react-router-dom';
import Chatroom from './chatroom';
import MessagesList from "./messages_list";

const Root = () => (
    <HashRouter>
      <Switch>
        <Route exact path="/" component={Chatroom} />
        <Route exact path="/:conversationId" component={MessagesList} />
      </Switch>
    </HashRouter>
)

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(<Root/>, root);
});