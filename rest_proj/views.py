from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from rest_proj.models import InfoModel
from rest_proj.serializers import InfoSerializer

# Create your views here.
@csrf_exempt
def infoList(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        info = InfoModel.objects.all()
        serializer = InfoSerializer(info, many=True)
        return JsonResponse(serializer.data, safe=False)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = InfoSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)


@csrf_exempt
def infoDetails(request, pk):
    """
    Retrieve, update or delete a code snippet.
    """
    try:
        info = InfoModel.objects.get(pk=pk)
    except InfoModel.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = InfoSerializer(info)
        return JsonResponse(serializer.data)

    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = InfoSerializer(snippet, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.errors, status=400)

    elif request.method == 'DELETE':
        info.delete()
        return HttpResponse(status=204)