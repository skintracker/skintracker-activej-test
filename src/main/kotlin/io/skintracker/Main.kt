package src.main.java.io.skintracker

import io.activej.http.AsyncServlet
import io.activej.http.HttpRequest
import io.activej.http.HttpResponse
import io.activej.inject.annotation.Provides
import io.activej.launchers.http.HttpServerLauncher

class Main : HttpServerLauncher() {
    @Provides
    fun servlet(): AsyncServlet {
        return { _: HttpRequest -> HttpResponse.ok200().withPlainText("Hello, World!") } as AsyncServlet
    }
}

fun main(args: Array<String>) {
    val launcher = Main()
    launcher.launch(args)
}