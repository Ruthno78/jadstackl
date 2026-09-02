package com.jadstacklotto.app

object TicketRenderer {
    fun render(company: String, ticket: String, date: String, time: String, agent: String, phone: String, lines: List<String>, total: String, width: Int = 32): String {
        fun center(s: String) = s.padStart(((width - s.length) / 2) + s.length).padEnd(width)
        val out = StringBuilder()
        out.append(center(company.uppercase())).append("\n")
        out.append(center("TICKET DE JEU")).append("\n")
        out.append("-".repeat(width)).append("\n")
        out.append("N° Ticket: ").append(ticket).append("\n")
        out.append("Date: ").append(date).append("\n")
        out.append("Heure: ").append(time).append("\n")
        out.append("Agent: ").append(agent).append("\n")
        out.append("Téléphone: ").append(phone).append("\n")
        out.append("-".repeat(width)).append("\n")
        lines.forEach { out.append(it).append("\n") }
        out.append("-".repeat(width)).append("\n")
        out.append("TOTAL").append(" ".repeat((width - 6 - total.length).coerceAtLeast(1))).append(total).append(" HTG\n")
        out.append("-".repeat(width)).append("\n")
        out.append("---JADSTACKLOTTO---\n")
        out.append("Verifye fich ou avan deplase\n")
        out.append("Fich la peyap sèlman bay pòtè a\n")
        out.append("Montana an dwe reklame avan 90 jou\n")
        out.append("-".repeat(width)).append("\n\n\n")
        return out.toString()
    }
}
