package com.dingpet.lostpets.p002.controller;

import java.io.IOException;
import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.protobuf.ByteString;

@RequestMapping("/lostpets/p002/*")
@RestController
public class LostPets_P002_Controller {
	
	@GetMapping("/label")
	public void label(){
		/*
		// Instantiates a client
	    try (ImageAnnotatorClient vision = ImageAnnotatorClient.create()) {

	      // The path to the image file to annotate
	      String fileName = "‪//dog.jpg";
	      

	      // Reads the image file into memory
	      Path path = Paths.get(fileName);
	      System.out.println(path);
	      byte[] data = Files.readAllBytes(path);
	      ByteString imgBytes = ByteString.copyFrom(data);

	      // Builds the image annotation request
	      List<AnnotateImageRequest> requests = new ArrayList<>();
	      Image img = Image.newBuilder().setContent(imgBytes).build();
	      Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
	      AnnotateImageRequest request =
	          AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
	      requests.add(request);

	      // Performs label detection on the image file
	      BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
	      List<AnnotateImageResponse> responses = response.getResponsesList();

	      for (AnnotateImageResponse res : responses) {
	        if (res.hasError()) {
	          System.out.printf("Error: %s\n", res.getError().getMessage());
	          return;
	        }

	        for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
	          annotation
	              .getAllFields()
	              .forEach((k, v) -> System.out.printf("%s : %s\n", k, v.toString()));
	        }
	      }
	    } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		
		String gcsPath = "gs://doge_detector/pom.jpg";
		//String gcsPath = "http://www.dingpet.shop:8080/lost/a6f6b707-b5c3-471f-a9de-b43f7e46d998_frontImage_blue.jpg";
		PrintStream out = new PrintStream(System.out);
		
		List<AnnotateImageRequest> requests = new ArrayList<>();

	    ImageSource imgSource = ImageSource.newBuilder().setGcsImageUri(gcsPath).build();
	    Image img = Image.newBuilder().setSource(imgSource).build();
	    Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
	    AnnotateImageRequest request =
	        AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
	    requests.add(request);

	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
	      BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	      List<AnnotateImageResponse> responses = response.getResponsesList();

	      for (AnnotateImageResponse res : responses) {
	        if (res.hasError()) {
	          out.printf("Error: %s\n", res.getError().getMessage());
	          return;
	        }

	        // For full list of available annotations, see http://g.co/cloud/vision/docs
	        for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
	          annotation.getAllFields().forEach((k, v) -> out.printf("%s : %s\n", k, v.toString()));
	        }
	        
	        String theData = com.google.protobuf.util.JsonFormat.printer().print(response);
	        System.out.println(theData);
	      }
	    } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}