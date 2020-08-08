#!/usr/bin/env perl
use Mojolicious::Lite -signatures;

get '/' => sub ($c) {
  $c->render(template => 'index');
};

get '/foo' => sub ($c) {
  $c->render(text => 'Hello World!');
};

app->start;
