from django.shortcuts import render
from rest_framework.response import Response
from django.views.decorators.http import require_http_methods
import json
from lemmagen.lemmatizer import Lemmatizer

# Create your views here.

@require_http_methods(['GET'])
def index(request,phrase_list):
	print("INDEX with phrase list:",phrase_list)
	a = Lemmatizer()
	lemmatised_list = []

	for i,word in enumerate(phrase_list):
		if i:
			lemmatised_list.append(a.lemmatize(word) + " ")

	return Response(json.dumps(lemmatised_list))