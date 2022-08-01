require "prawn"

class RecordPdf < Prawn::Document

    def initialize(project)
    
        super(
            page_size: 'A4',
            top_margin: 40,
            bottom_margin: 30,
            left_margin: 20,
            right_margin: 20
        )
        
        # Set project and field info
        @project = project
        @project_fields = Field.where(project_id: @project)

        header()
        details()
        field()
    end

    def header()
        # Project title and description
        font_size 30
        text @project.name
        font_size 14
        text @project.description
        stroke_horizontal_rule
        move_down 10
    end

    def details()
        # Project details
        font_size 14
        text "Founder: " + @project.founder
        move_down 5
        text "Grants: " + @project.grant
        move_down 5
        text "Start: " + @project.start.strftime("%Y-%m-%d") + "   End: " + @project.end.strftime("%Y-%m-%d")
        move_down 5
        if @project.active
            text "Active: True"
        else
            text "Active: False"
        end 
        move_down 5
        text "Contributors:"
        text @project.invites

        stroke_horizontal_rule
        move_down 15
    end

    def field()
        #Project Field Section
        font_size 20
        text "Project Fields"
        move_down 5
        font_size 15
        @project_fields.each do |field|
            text 'Title: ' + field.title
            move_down 5
            text 'Field Type:  ' + field.field_type
            move_down 5
            text 'Impact Type:  ' + field.impactType
            move_down 5
            text 'Date: ' + field.date.strftime("%Y-%m-%d")
            move_down 5
            text 'Field Industry: ' + field.contacts
            move_down 5
            text 'Evidence Attachments:'
            if field.persisted?
                if field.files.present?
                    field.files.each do |file|
                        text file.filename.to_s()
                    end
                end
            end
            text 'Evidence comments: ' + field.comments
            move_down 10
            stroke_horizontal_rule
            move_down 10
        end
    end
end