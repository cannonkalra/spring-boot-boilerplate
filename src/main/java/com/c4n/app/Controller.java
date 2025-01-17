package com.c4n.app;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class Controller {
  @GetMapping("/hello")
  public String hello() {
    log.debug("Route: /hello");
    return "Hello World!";
  }

  @GetMapping("/api/v1/test")
  public ResponseEntity<List<String>> test() {
    return ResponseEntity.ok(List.of("A", "B", "C"));
  }
}
